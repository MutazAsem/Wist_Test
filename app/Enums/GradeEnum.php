<?php

namespace App\Enums;

use Filament\Support\Contracts\HasLabel;

enum GradeEnum: string implements HasLabel
{
    case EXCELLENT = 'Excellent';
    case VERY_GOOD = 'Very Good';
    case GOOD = 'Good';
    case ACCEPTABLE = 'Acceptable';
    case FAILED = 'Failed';

    public function getLabel(): ?string
    {
        return match ($this) {
            self::EXCELLENT => 'Excellent',
            self::VERY_GOOD => 'Very Good',
            self::GOOD => 'Good',
            self::ACCEPTABLE => 'Acceptable',
            self::FAILED => 'Failed',
            
        };
    }
}