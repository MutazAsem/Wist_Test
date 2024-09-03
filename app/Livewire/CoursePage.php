<?php

namespace App\Livewire;

use Livewire\Attributes\Title;
use Livewire\Component;

#[Title('Courses - Wist Academy')]

class CoursePage extends Component
{
    public function render()
    {
        return view('livewire.course-page');
    }
}
