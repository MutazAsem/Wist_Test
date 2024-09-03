<?php

namespace App\Enums;

use Filament\Support\Contracts\HasLabel;

enum ProgramStatusEnum: string implements HasLabel
{
    case NEW = 'New';
    case WILL_START_SOON = 'Will Start Soon';
    case RUNNING_NOW = 'Running Now';
    case STOPPED = 'Stopped';
    case CANCELLED = 'Cancelled';

    public function getLabel(): ?string
    {
        return match ($this) {
            self::NEW => 'New',
            self::WILL_START_SOON => 'Will Start Soon',
            self::RUNNING_NOW => 'Running Now',
            self::STOPPED => 'Stopped',
            self::CANCELLED => 'Cancelled',
            
        };
    }
}