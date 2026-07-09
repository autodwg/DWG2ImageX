

 	Dim objImage
   	Set objImage= CreateObject("DWG2ImageX.Converter")
    	
	objImage.Width  = 800
    	objImage.Height =  600
	objImage.Background = 255			'0--black, 1--red, ... 255--white
        objImage.ImageFormat = 1 			'0--bmp, 1--jpeg, 2--gif, 3--png, 4--tiff	
        objImage.InputFile = "test.dwg"  
        objImage.ColorMode = 0				'Set output image's color 0--color 1-- white and black
	MsgBox objImage.Version 			'Get the drawing file version.
	objImage.PenWidth(7) =  1			'Set Line width  PenWidth( autocad color index 0~255, 0-black 7-whie) = line widht in piexels

       
	MsgBox "AutoDWG: Total "& objImage.ViewCount &" Views"
		For I=1 to objImage.ViewCount
		strViewName = objImage.ViewName(I)

		MsgBox "Converting view: "& strViewName& "..."
		nWidth = objImage.ViewWidth(I)
		nHeight= objImage.ViewHeight(I)
		MsgBox "Width="&nWidth&" Height="&nHeight

		'strOutput = "c:\Output\"&strViewName
              	strOutput = strViewName			'Output file name, include path
		objImage.Convert strOutput, strViewName
	Next
	   If Err.Number < 0 Then
		MsgBox Err.Description
        End If
        


	