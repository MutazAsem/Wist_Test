<?php

namespace App\Filament\Resources\StudentProgramResource\Pages;

use App\Filament\Resources\StudentProgramResource;
use Filament\Actions;
use Filament\Resources\Components\Tab;
use Filament\Resources\Pages\ListRecords;

class ListStudentPrograms extends ListRecords
{
    protected static string $resource = StudentProgramResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }

    public function getTabs(): array
    {
        return [
            null => Tab::make('All')
            ->icon('heroicon-o-rectangle-stack'),
            'Studying Now' => Tab::make()->query(fn ($query) => $query->where('status','Studying Now'))
            ->icon('heroicon-o-arrow-path-rounded-square'),
            'Program Completed' => Tab::make()->query(fn ($query) => $query->where('status','Program Completed'))
            ->icon('heroicon-o-check-circle'),
            'Stopped' => Tab::make()->query(fn ($query) => $query->where('status','Stopped'))
            ->icon('heroicon-o-pause'),
        ];
    }
}
