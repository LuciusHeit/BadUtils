<script>
	import Rolling from "./rolling.svelte";

        
    let rawInput = "";
    let results = [0, 0, 0, 0, 0, 0]
    let htmlOutput = "";

    const RollColors = [
        "#F1E9DA",
        "#EECDCC",
        "#EBB0BE",
        "#D90368",
        "#970B78",
        "#a413d8"
    ]

    function extrapolateResult(){
        
        rawInput = "";
        results = [0, 0, 0, 0, 0, 0]
        htmlOutput = "";

        let inputArray;

        rawInput = document.getElementById("rawInput").value;

        if(rawInput.indexOf("(") != -1 && rawInput.indexOf(")") != -1){
            inputArray = rawInput.substring(
                rawInput.indexOf("(") + 1, 
                rawInput.lastIndexOf(")")
            ).replaceAll("*","").replaceAll(" ","").split(',').map( Number );
        }
        else{
            inputArray = rawInput.replaceAll("(", "").replaceAll(")", "").replaceAll("*","").replaceAll(" ","").split(',').map( Number );
        }
        inputArray.sort(function(a, b) {
            return b - a;
        });

        if(inputArray.length != 24){
            htmlOutput = "Errore nell'input"
        }else{
            for(let i = 0; i <= 18; i++){
                results[Math.ceil((i+1)/3)-1] += inputArray[i];
                htmlOutput += "<span style='color:"+RollColors[inputArray[i]-1]+"; font-weight: bold;'>"+ inputArray[i] +"</span>, ";
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

<Rolling></Rolling>

<div class="calculator">
    <div>
        <label for="rawInput">Risultato dei dadi: </label>
        <input id="rawInput" type="textarea" placeholder="(Inserire il risultato)"/>
        <br><br><input type="button" class="button-styled" value="Premere per calcolare" on:click={extrapolateResult}>
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
    h2{
        padding-top: 20px;
    }
</style>