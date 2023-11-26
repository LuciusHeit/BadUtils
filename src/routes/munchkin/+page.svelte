<script>
        
    let rawInput = "";
    let results = [0, 0, 0, 0, 0, 0]
    let htmlOutput = "";

    function extrapolateResult(){
        
        rawInput = "";
        results = [0, 0, 0, 0, 0, 0]
        htmlOutput = "";

        rawInput = document.getElementById("rawInput").value;

        let inputArray = rawInput.substring(
            rawInput.indexOf("(") + 1, 
            rawInput.lastIndexOf(")")
        ).replaceAll("*","").replaceAll(" ","").split(',').map( Number );
        
        inputArray.sort(function(a, b) {
            return b - a;
        });

        if(inputArray.length != 24){
            htmlOutput = "Errore nell'input"
        }else{
            for(let i = 0; i <= 18; i++){
                results[Math.ceil((i+1)/3)-1] += inputArray[i];
                htmlOutput = htmlOutput + inputArray[i] + ", ";
            }
            htmlOutput = htmlOutput.substring(0, htmlOutput.length-2);
            htmlOutput = "<div class='result'>"+htmlOutput+"<br><br>Risultati prendendo i massimali: <br><br>"+results[0]+"<br>"+results[1]+"<br>"+results[2]+"<br>"+results[3]+"<br>"+results[4]+"<br>"+results[5]+"</div>"
        }

        document.getElementById("result").innerHTML = htmlOutput;
    }
</script>

<div>
    <h1 class="purple title">Munchkin Visualizer</h1>
</div>

<div>
    Questo è un semplice sistema per estrapolare i risultati da un tiro per le statistiche di D&D col metodo Munchkin (24d8).
    <br>Basta inserire il risultato dei tiri nella casella testuale, e verrano mostrati i 18 risultati migliori in ordine, insieme a un calcolo rapido delle statistiche prendendo in sequenza i migliori 3 risultati.
</div>

<div class="calculator">
    <div>
        <label for="rawInput">Risultato dei dadi: </label>
        <input id="rawInput" type="textarea" placeholder="(Risultato copiato da Avrae da parentesi a parentesi)"/>
        <br><input type="button" class="button-styled" value="Premere per calcolare" on:click={extrapolateResult}>
    </div>

    <div>
        <h2>Risultato: </h2>
        
        <p id="result"></p>
    </div>
</div>

<style>
    .calculator{
        padding: 10px;
        padding-top: 20px;
    }
    .button-styled{
        margin-top: 20px;
        margin: auto;
    }
</style>