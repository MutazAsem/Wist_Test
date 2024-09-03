<?php

namespace App\Filament\Resources;

use App\Enums\GradeEnum;
use App\Enums\StudentStatusEnum;
use App\Filament\Resources\StudentProgramResource\Pages;
use App\Filament\Resources\StudentProgramResource\RelationManagers;
use App\Models\StudentProgram;
use App\Models\User;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class StudentProgramResource extends Resource
{
    protected static ?string $model = StudentProgram::class;

    protected static ?string $navigationIcon = 'heroicon-o-user-plus';

    protected static ?string $recordTitleAttribute = 'id';

    public static function getGloballySearchableAttributes(): array
    {
        return ['student.name'];
    }

    protected static int $globalSearchResultsLimit = 5;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Group::make()
                    ->schema([
                        Forms\Components\Section::make()
                            ->schema([
                                Forms\Components\Select::make('student_id')
                                    ->options(User::whereHas('roles', function ($query) {
                                        $query->where('name', 'panel_user');
                                    })->pluck('name', 'id'))
                                    ->native(false)
                                    ->label('Student Name')
                                    ->required()
                                    ->markAsRequired(false),
                                Forms\Components\Select::make('program_id')
                                    ->relationship('educationalProgram', 'name')
                                    ->required()
                                    ->markAsRequired(false)
                                    ->native(false),
                                Forms\Components\Select::make('status')
                                    ->options(StudentStatusEnum::class)
                                    ->default('New')
                                    ->native(false)
                                    ->required()
                                    ->markAsRequired(false)
                                    ->columnSpanFull(),
                                Forms\Components\TextInput::make('score')
                                    ->numeric()
                                    ->minValue(0),
                                Forms\Components\Select::make('grade')
                                    ->options(GradeEnum::class)
                                    ->native(false),
                            ])->columns(2)
                    ])->columnSpanFull()
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('student.name')
                    ->sortable()
                    ->searchable(),
                Tables\Columns\TextColumn::make('educationalProgram.name')
                    ->sortable()
                    ->searchable(),
                Tables\Columns\SelectColumn::make('status')
                    ->options(StudentStatusEnum::class)
                    ->searchable()
                    ->sortable(),
                Tables\Columns\TextColumn::make('score')
                    ->numeric()
                    ->sortable()
                    ->searchable(),
                Tables\Columns\TextColumn::make('grade')
                    ->searchable()
                    ->sortable(),
            ])
            ->filters([
                Tables\Filters\SelectFilter::make('Student Name')
                ->options(User::whereHas('roles', function ($query) {
                    $query->where('name', 'panel_user');
                })->pluck('name', 'id')),
                Tables\Filters\SelectFilter::make('Program Name')
                    ->relationship('educationalProgram', 'name'),
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
            'index' => Pages\ListStudentPrograms::route('/'),
            'create' => Pages\CreateStudentProgram::route('/create'),
            'edit' => Pages\EditStudentProgram::route('/{record}/edit'),
        ];
    }
}
