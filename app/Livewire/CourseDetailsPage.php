<?php

namespace App\Livewire;

use Livewire\Attributes\Title;
use Livewire\Component;

#[Title('Course Details - Wist Academy')]

class CourseDetailsPage extends Component
{
    public function render()
    {
        return view('livewire.course-details-page');
    }
}
