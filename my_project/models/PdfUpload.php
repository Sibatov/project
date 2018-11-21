<?php

namespace app\models;

use CKSource\CKFinder\Filesystem\File\UploadedFile;
use yii\base\Model;
use Yii;

class PdfUpload extends Model{

    public $pdf;

    public function rules(){

        return [
            [['pdf'], 'required'],
            [['pdf'], 'file', 'extensions'=> 'pdf,docx,pptx']
        ];
    }

    public function uploadFile($file, $currentPdf){

        $this->pdf= $file;
        if ($this->validate()){

            $this->deleteCurrentPdf($currentPdf);

            return $this->savePdf();

        }

    }


    private function getFolder(){


        return Yii::getAlias('@web'). 'pdf-files/';
    }

    private function generateFileName(){

        return strtolower(md5(uniqid($this->pdf->baseName)) . '.' . $this->pdf->extension);
    }
    public function deleteCurrentPdf($currentPdf){

        if  (is_file((file_exists($this->getFolder() . $currentPdf)))){

            unlink($this->getFolder() . $currentPdf);
        }
    }

   public function fileExists(){

        if(!empty($currentPdf) && $currentPdf !=null){

            return file_exists($this->getFolder(). $currentPdf);
        }
    }

    public function savePdf(){
        $filename = $this->generateFileName();

        $this->pdf->saveAs($this->getFolder() . $filename);

        return $filename;
    }

}