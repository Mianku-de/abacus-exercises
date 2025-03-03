function Stelle-StrichRechenAufgabe {
    param(
        [ValidateSet("Subtraktion", "Addition")]
        [string]$Operation = 'Addition',
        [int]$Operanden = 2,
        [int]$Ziffern = 4       
    )

    $Aufgabenstellung = ""
    $Ergebnis = 0
    $Minimum = [math]::pow( 10, ($Ziffern -1) )
    $Maximum = [math]::pow( 10, $Ziffern )

    switch ($Operation) {
        Addition {
            for ( $i = 1; $i -le $Operanden; $i++) {
                $Zufallszahl = [int](Get-Random -Minimum $Minimum -Maximum $Maximum)
                $Aufgabenstellung += [string]$Zufallszahl
                    if ( $i -lt $Operanden ) { $Aufgabenstellung += " + " }
                        else { $Aufgabenstellung += " = " }
                $Ergebnis += $Zufallszahl
            }        
        }
        Subtraktion {
            $Minuend = [int](Get-Random -Minimum $Minimum -Maximum $Maximum)
            $Aufgabenstellung += [string]$Minuend + " - "
            $Ergebnis = $Minuend
            for ( $i = 1; $i -lt $Operanden; $i++) {
                $NeuerSubtrahend = [int](Get-Random -Minimum $Minimum -Maximum $Maximum)               
                $Aufgabenstellung += [string]$NeuerSubtrahend    
                    # wenn es der letzte Durchlauf ist:
                    if ( ($Operanden - 1) -ne $i ) { $Aufgabenstellung += " - " }                    
                $Ergebnis -= $NeuerSubtrahend
            }  
        }
    }            

    "{0}" -f $Aufgabenstellung 
    Read-Host
    "= {0}" -f $Ergebnis
}
