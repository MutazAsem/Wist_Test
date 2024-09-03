<?php

namespace App\Livewire;

use App\Models\Category;
use App\Models\EducationalProgram;
use Livewire\Attributes\Title;
use Livewire\Component;

#[Title('Home - Wist Academy')]

class HomePage extends Component
{
    public function render()
    {
        $categories = Category::withCount('category')->get();

        return view('livewire.home-page',[
            'categories' => $categories,
        ]);
    }
}
