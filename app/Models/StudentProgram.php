<?php

namespace App\Models;

use App\Enums\GradeEnum;
use App\Enums\StudentStatusEnum;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\SoftDeletes;

class StudentProgram extends Model
{
    use HasFactory,SoftDeletes;


    protected $fillable = [
        'student_id','program_id','status','score','grade',
    ];

    protected $casts = [
        'status' => StudentStatusEnum::class,
        'grade' => GradeEnum::class,
    ];

    public function student ():BelongsTo
    {
        return $this->belongsTo(User::class,'student_id');
    }

    public function educationalProgram ():BelongsTo
    {
        return $this->belongsTo(EducationalProgram::class,'program_id');
    }
}
