<?php

namespace App\Filament\Widgets;

use App\Models\EducationalProgram;
use App\Models\StudentProgram;
use App\Models\Subject;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;
use BezhanSalleh\FilamentShield\Traits\HasWidgetShield;

class StatsOverview extends BaseWidget
{
    use HasWidgetShield;
    
    protected function getStats(): array
    {
        return [
            Stat::make('Total Programs', EducationalProgram::query()->where('available', 1)->count()),
            Stat::make('Total Students', StudentProgram::query()->count())
            ->description('Increase in Students')
                ->descriptionIcon('heroicon-m-arrow-trending-up')
                ->color('success')
                ->chart([9, 6, 10, 4, 8, 6, 4, 10]),
            Stat::make('Total Subjects', Subject::query()->count()),
            Stat::make('Studying Now Students', StudentProgram::query()->where('status', 'Studying Now')->count()),
            Stat::make('Graduates Students', StudentProgram::query()->where('status', 'Program Completed')->count()),
            Stat::make('Stopped Studens', StudentProgram::query()->where('status', 'Stopped')->count()),
            Stat::make('New Programs', EducationalProgram::query()->where('status', 'New')->count()),
            Stat::make('Will Start Soon', EducationalProgram::query()->where('status', 'Will Start Soon')->count()),
            Stat::make('Running Now', EducationalProgram::query()->where('status', 'Running Now')->count()),
            Stat::make('Stopped', EducationalProgram::query()->where('status', 'Stopped')->count()),
            Stat::make('New Programs', EducationalProgram::query()->where('status', 'Cancelled')->count()),
        ];
    }
}
