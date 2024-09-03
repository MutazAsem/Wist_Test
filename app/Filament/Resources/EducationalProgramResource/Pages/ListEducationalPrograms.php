<?php

namespace App\Filament\Resources\EducationalProgramResource\Pages;

use App\Filament\Resources\EducationalProgramResource;
use Filament\Actions;
use Filament\Resources\Components\Tab;
use Filament\Resources\Pages\ListRecords;

class ListEducationalPrograms extends ListRecords
{
    protected static string $resource = EducationalProgramResource::class;

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
            'New' => Tab::make()->query(fn ($query) => $query->where('status','New'))
            ->icon('heroicon-o-sparkles'),
            'Will Start Soon' => Tab::make()->query(fn ($query) => $query->where('status','Will Start Soon'))
            ->icon('heroicon-o-clock'),
            'Running Now' => Tab::make()->query(fn ($query) => $query->where('status','Running Now'))
            ->icon('heroicon-o-play'),
            'Stopped' => Tab::make()->query(fn ($query) => $query->where('status','Stopped'))
            ->icon('heroicon-o-pause'),
            'Cancelled' => Tab::make()->query(fn ($query) => $query->where('status','Cancelled'))
            ->icon('heroicon-o-x-circle'),
        ];
    }
}
