<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Validator;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post('/pin',function(Request $r){

    $validator = Validator::make($r->all(), [
        'regi_number'   => 'required | integer | min:1',
        'type'          => 'required | string | min:1'
    ]);

    if ($validator->fails()) {
        return response()->json($validator->getMessageBag(),400);
    }

    return response()->json($r->regi_number . "-" . $r->type);
});

Route::post('/result', 'ResultController@getResult');