Local Const $180_div_pi = 180 / ACos(-1)

$it = _SearchCircumference(194, 762, 160, 0xFA3C32)
MouseMove($it[1],$it[2],0)
Sleep(5000)

Func _Angle($tX, $tY, $cX, $cY)
    $mx = $tX - $cX
    $my = $cY - $tY
    $angle = ATan($my / $mx) * $180_div_pi
    If $mx < 0 Then
        $angle = 180 + $angle
    ElseIf $mx >= 0 And $my < 0 Then
        $angle = 360 + $angle
    EndIf
    Return Int($angle)
EndFunc   ;==>_Angle

Func Angle($X1, $Y1, $Ang, $Length)
    Local $Return[3]
    $Return[1] = $X1 + ($Length * Cos($Ang / 180 * 3.14159265358979))
    $Return[2] = $Y1 - ($Length * Sin($Ang / 180 * 3.14159265358979))
    Return $Return
EndFunc   ;==>Angle

Func _SearchCircumference($centerX, $centerY, $radius, $color)
For $i = 0 To 360 Step +1
$angle = $i + 90
$rod = Angle($centerX,$centerY, $angle, $radius)
$iColor = PixelGetColor($rod[1] , $rod[2]) ;; code on cord
If $iColor == $color Then
Return $rod
ExitLoop
EndIf
Next
EndFunc