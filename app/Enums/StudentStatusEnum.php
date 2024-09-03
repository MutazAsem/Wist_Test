<?php

namespace App\Enums;

use Filament\Support\Contracts\HasLabel;

enum StudentStatusEnum: string implements HasLabel
{
    case STUDYIND_NOW = 'Studying Now';
    case PROGRAM_COMPLETED = 'Program Completed';
    case STOPPED = 'Stopped';

    public function getLabel(): ?string
    {
        return match ($this) {
            self::STUDYIND_NOW => 'Studying Now',
            self::PROGRAM_COMPLETED => 'Program Completed',
            self::STOPPED => 'Stopped',
            
        };
    }
}