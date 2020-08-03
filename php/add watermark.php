<?php
    if (! extension_loaded('gd')) { // Проверяем установку библиотеки GD	
        echo 'GD не установлено. Обратитесь к администратору вашего сайта!';
        exit;
    }
	
    $sOrigImg = "28fae43916eecaa5050e8a168b96100f_full.jpg";
    $sWmImg = "wp.png"; //watermark
 
	$aImgInfo = getimagesize($sOrigImg);
    $aWmImgInfo = getimagesize($sWmImg);

    if (is_array($aImgInfo) && count($aImgInfo)) {
		
		//header ("Content-type: image/png");

        $iSrcWidth = $aImgInfo[0];
        $iSrcHeight = $aImgInfo[1];
        $iFrameSize = 0;
        $rImage = imagecreatetruecolor($iSrcWidth+$iFrameSize*2, $iSrcHeight+$iFrameSize*2); // Создаем новое изображение
        $rSrcImage = imagecreatefromjpeg($sOrigImg); //  Создаем исходное изображение

        imagecopy($rImage, $rSrcImage, $iFrameSize, $iFrameSize, 0, 0, $iSrcWidth, $iSrcHeight); // Копируем полученное изображение на изображение-источник				 
		 
        if (is_array($aWmImgInfo) && count($aWmImgInfo)) {
            
		   $rWmImage = imagecreatefrompng($sWmImg); //  Создаем изображение водяного знака
           imagecopy($rImage, $rWmImage , $iSrcWidth-$aWmImgInfo[0] - 10, $iFrameSize + 10, 0 , 0, $aWmImgInfo[0], $aWmImgInfo[1] ); // Копируем изображение водяного знака на изображение источник
		   
        }
		
		$iTextColor = imagecolorallocate($rImage, 255, 255, 255); // Определяем цвет текста
        $sIP = $_SERVER['REMOTE_ADDR']; // Определяем IP посетителя
        imagestring($rImage, 5, $iFrameSize*2, $iFrameSize*2, "Your IP adress: {$sIP}, {$sOrigImg} - ({$iSrcWidth} x {$iSrcHeight})", $iTextColor); // Рисуем текст


        imagepng($rImage,"file.png"); // Выводим изображение
		
    } else {
        echo 'Image error!';
        exit;
    }
?>
<img src="file.png" />