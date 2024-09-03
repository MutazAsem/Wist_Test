<?php

namespace App\Models;

use App\Enums\ProgramStatusEnum;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\SoftDeletes;

class EducationalProgram extends Model
{
    use HasFactory,SoftDeletes;

    protected $fillable = [
        'name','subject_id','category_id','trainer_id','description','price','start_time','end_time',
        'start_date','end_date','hours','available','status',
    ];

    protected $casts = [
        'status' => ProgramStatusEnum::class,
    ];

    public function subject ():BelongsTo
    {
        return $this->belongsTo(Subject::class,'subject_id');
    }

    public function category ():BelongsTo
    {
        return $this->belongsTo(Category::class,'category_id');
    }

    public function trainer ():BelongsTo
    {
        return $this->belongsTo(User::class,'trainer_id');
    }
}
