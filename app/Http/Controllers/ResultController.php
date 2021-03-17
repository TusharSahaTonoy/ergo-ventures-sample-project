<?php

namespace App\Http\Controllers;

use App\Result;
use App\Student;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class ResultController extends Controller
{
    public function getResult(Request $r)
    {
        $validator = Validator::make($r->all(), [
            'pin'          => 'required | string | min:1'
        ]);

        if ($validator->fails()) {
            return response()->json($validator->getMessageBag(), 400);
        }
        
        // 4. GET result sheet (Registration Number, Student Name, Exam Type, Exam Year, Subject (1-10): grade)
        

        try {
            
            list($regi_number, $exam_type) = explode('-', $r->pin);

            $data = [
                'registration_number'   => $regi_number,
                'exam_type'             => $exam_type
            ];

            $result = DB::table((new Result())->getTable() . " as RES")

                ->join((new Student())->getTable() . " as STU", 'STU.id', '=', 'RES.student_id')

                ->where([
                    'RES.exam_type'   => $exam_type,
                    'STU.regi_number' => $regi_number,
                ])
                ->get(['name', 'subject', 'grade', 'exam_year']);

            
            if(! count($result??[]))
            {
                return response()->json(['mgs' => 'No result found']);
            }

            // setting common attributes
            $data['student_name'] = $result[0]->name;
            $data['year'] = $result[0]->exam_year;

            foreach ($result as $item) {
                $data['result'][] = ['subject' => $item->subject, 'grade' => $item->grade];
            }

            return response()->json($data);

        } catch (Exception $e) {

            // $e->getMessage();
            return response()->json(['mgs' => 'Opps! Service Not Available']);
            
        }
        
    }
}
