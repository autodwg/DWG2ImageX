# DWG2ImageX
**AutoDWG DWG to Image Component**

## License Notice
1. Free trial / non-commercial use: GNU LGPLv3
2. Commercial production use, closed-source integration requires purchasing our commercial license.

Contact info@autodwg.com for commercial authorization.

## AutoDWG DWG to Image Control Component
DWG2ImageX allows you to convert DWG/DXF/DWF file into GIF, JPEG, BMP, PNG directly, without need of AutoCAD.

### Key features
- Convert DWG, DXF and DWF file to Image file(PNG,GIF,BMP,JPEG).
- You may add font path and xref path.
- You may set image resolution and image paper size.
- Support AutoCAD drawing in versions from R9 to 2027.

### Free Trial Download Link


## User Guide
### Getting Started
Quick setup (The steps below are for 64-bit installation.)

#### Step 1: Register the DLL Component
Double-click `reg.bat` to automatically register `DWG2ImageX64.dll` on your system.

If registration fails:
Open Command Prompt as Administrator via:
Start Menu → Windows System → Right-click "Command Prompt" → Run as Administrator

Manually register the DLL using command:
```cmd
regsvr32 DWG2ImageX64.dll
```
#### Step 2: Test with Example VBScript
Use the provided sample script run.vbs in the Examples folder to verify functionality.
Ensure the script executes without errors and generates the expected image output.

**Sample Code**

Sample Code (VB) for your reference:
```
Dim objImage
Set objImage= CreateObject("DWG2ImageX.Converter")
objImage.Width  = 4200
objImage.Height =  2918
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
        
```
