<?php
    if (! extension_loaded('gd')) { // ��������� ��������� ���������� GD	
        echo 'GD �� �����������. ���������� � �������������� ������ �����!';
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
        $rImage = imagecreatetruecolor($iSrcWidth+$iFrameSize*2, $iSrcHeight+$iFrameSize*2); // ������� ����� �����������
        $rSrcImage = imagecreatefromjpeg($sOrigImg); //  ������� �������� �����������

        imagecopy($rImage, $rSrcImage, $iFrameSize, $iFrameSize, 0, 0, $iSrcWidth, $iSrcHeight); // �������� ���������� ����������� �� �����������-��������				 
		 
        if (is_array($aWmImgInfo) && count($aWmImgInfo)) {
            
		   $rWmImage = imagecreatefrompng($sWmImg); //  ������� ����������� �������� �����
           imagecopy($rImage, $rWmImage , $iSrcWidth-$aWmImgInfo[0] - 10, $iFrameSize + 10, 0 , 0, $aWmImgInfo[0], $aWmImgInfo[1] ); // �������� ����������� �������� ����� �� ����������� ��������
		   
        }
		
		$iTextColor = imagecolorallocate($rImage, 255, 255, 255); // ���������� ���� ������
        $sIP = $_SERVER['REMOTE_ADDR']; // ���������� IP ����������
        imagestring($rImage, 5, $iFrameSize*2, $iFrameSize*2, "Your IP adress: {$sIP}, {$sOrigImg} - ({$iSrcWidth} x {$iSrcHeight})", $iTextColor); // ������ �����


        imagepng($rImage,"file.png"); // ������� �����������
		
    } else {
        echo 'Image error!';
        exit;
    }
?>
<img src="file.png" />