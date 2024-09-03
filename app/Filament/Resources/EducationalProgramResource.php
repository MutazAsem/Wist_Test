<?php

namespace App\Filament\Resources;

use App\Enums\ProgramStatusEnum;
use App\Filament\Resources\EducationalProgramResource\Pages;
use App\Filament\Resources\EducationalProgramResource\RelationManagers;
use App\Models\EducationalProgram;
use App\Models\User;
use Carbon\Carbon;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class EducationalProgramResource extends Resource
{
    protected static ?string $model = EducationalProgram::class;

    protected static ?string $navigationIcon = 'heroicon-o-academic-cap';

    protected static ?string $recordTitleAttribute = 'id';

    public static function getGloballySearchableAttributes(): array
    {
        return ['name'];
    }

    protected static int $globalSearchResultsLimit = 5;

    public static function form(Form $form): Form
    {
        return $form

            ->schema([

                Forms\Components\Wizard::make([

                    Forms\Components\Wizard\Step::make('Program Information')
                        ->icon('heroicon-m-inbox-arrow-down')
                        ->schema([
                            Forms\Components\TextInput::make('name')
                                ->required()
                                ->markAsRequired(false)
                                ->maxLength(255),
                            Forms\Components\Select::make('subject_id')
                                ->relationship('subject', 'name')
                                ->native(false)
                                ->required()
                                ->markAsRequired(false),
                            Forms\Components\Select::make('category_id')
                                ->relationship('category', 'name')
                                ->native(false)
                                ->required()
                                ->markAsRequired(false),
                            Forms\Components\Select::make('trainer_id')
                                ->options(User::whereHas('roles', function ($query) {
                                    $query->where('name', 'trainer');
                                })->pluck('name', 'id'))
                                ->native(false)
                                ->required()
                                ->markAsRequired(false),
                            Forms\Components\Textarea::make('description')
                                ->required()
                                ->markAsRequired(false)
                                ->maxLength(65535)
                                ->columnSpanFull(),
                        ])->columns(2),
                    Forms\Components\Wizard\Step::make('Program Details')
                        ->icon('heroicon-m-inbox-stack')
                        ->schema([
                            Forms\Components\TimePicker::make('start_time')
                                ->native(false)
                                ->prefix('Program Starts in')
                                ->label('Start Time'),
                            Forms\Components\TimePicker::make('end_time')
                                ->native(false)
                                ->prefix('Program Ends in')
                                ->label('End Time'),
                            Forms\Components\DatePicker::make('start_date')
                                ->native(false)
                                ->prefix('Program Starts at')
                                ->label('Start Date')
                                ->live(onBlur: true)
                                ->reactive()
                                ->minDate(Carbon::today()),
                            Forms\Components\DatePicker::make('end_date')
                                ->native(false)
                                ->live(onBlur: true)
                                ->reactive()
                                ->prefix('Program Ends at')
                                ->label('End Date')
                                ->minDate(fn (callable $get) => $get('start_date')),
                            Forms\Components\TextInput::make('hours')
                                ->label('Hours Number')
                                ->suffix('Hours')
                                ->required()
                                ->markAsRequired(false)
                                ->numeric()
                                ->minValue(1),
                            Forms\Components\TextInput::make('price')
                                ->required()
                                ->markAsRequired(false)
                                ->numeric()
                                ->default(0)
                                ->minValue(1),
                            Forms\Components\Select::make('status')
                                ->options(ProgramStatusEnum::class)
                                ->native(false)
                                ->preload()
                                ->required()
                                ->markAsRequired(false),
                            Forms\Components\Toggle::make('available')
                                ->default(true)
                                ->required()
                                ->markAsRequired(false),
                        ])->columns(2),
                ])->columnSpanFull(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('name')
                    ->searchable()
                    ->sortable(),
                Tables\Columns\TextColumn::make('subject.name')
                    ->searchable()
                    ->sortable(),
                Tables\Columns\TextColumn::make('category.name')
                    ->searchable()
                    ->sortable(),
                Tables\Columns\TextColumn::make('trainer.name')
                    ->searchable()
                    ->sortable(),
                Tables\Columns\TextColumn::make('price')
                    ->numeric()
                    ->money('USD')
                    ->searchable()
                    ->sortable(),
                Tables\Columns\TextColumn::make('start_time')
                    ->label('Start Time')
                    ->searchable()
                    ->sortable()
                    ->time()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('end_time')
                    ->time()
                    ->searchable()
                    ->sortable()
                    ->label('End Time')
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('start_date')
                    ->date()
                    ->label('Start Date')
                    ->searchable()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('end_date')
                    ->date()
                    ->label('End Date')
                    ->searchable()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('hours')
                    ->numeric()
                    ->searchable()
                    ->sortable(),
                Tables\Columns\SelectColumn::make('status')
                    ->options(ProgramStatusEnum::class)
                    ->searchable()
                    ->sortable(),
                Tables\Columns\IconColumn::make('available')
                    ->boolean()
                    ->sortable(),

            ])
            ->filters([
                Tables\Filters\SelectFilter::make('Subject')
                    ->relationship('subject', 'name'),
                Tables\Filters\SelectFilter::make('Category')
                    ->relationship('category', 'name'),
                Tables\Filters\SelectFilter::make('Trainer')
                    ->options(User::whereHas('roles', function ($query) {
                        $query->where('name', 'trainer');
                    })->pluck('name', 'id')),
            ])
            ->actions([
                Tables\Actions\ActionGroup::make([
                    Tables\Actions\ViewAction::make(),
                    Tables\Actions\EditAction::make(),
                    Tables\Actions\DeleteAction::make(),
                ])
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListEducationalPrograms::route('/'),
            'create' => Pages\CreateEducationalProgram::route('/create'),
            'edit' => Pages\EditEducationalProgram::route('/{record}/edit'),
        ];
    }
}
