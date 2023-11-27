<script>
	import ScrollingNumber from "./scrollingNumber.svelte";
	import { fade, scale } from 'svelte/transition';
    
    class Result {
        constructor(old) {
            this.old = old;
            this.new = getRandomInt(6);
        }
    }


    let results = [];
    let show = false;

    const animate = (node, args) =>
        args.cond ? fade(node, args) : scale(node, args);



    function reroll(){

        if(!show){
        
            for(let i = 0; i<24; i++){
                results.push(
                    new Result(0)
                )
            }

            show = !show;
        }
        else{
            let tempResults = [];
            
            results.forEach(r => {
            tempResults.push(new Result(r.new));
                
            results = tempResults;
        });
        }


    }

    function getRandomInt(max) {
        return Math.floor(Math.random() * max) + 1;
    }

    function toClipboard(){
        let copyText = "";

        results.forEach(r => {
            copyText += r.new + ", ";
        });

        copyText = copyText.substring(0, copyText.length-2);

        navigator.clipboard.writeText(copyText);

        var tooltip = document.getElementById("tooltip");
        tooltip.innerHTML = "Copied: " + copyText;
    }
    
    function outFunc() {
        var tooltip = document.getElementById("tooltip");
        tooltip.innerHTML = "Copy to clipboard";
    }

</script>


{#if show}
<div class="rolls" transition:animate>
    {#each results as r}
        <ScrollingNumber bind:start={r.old} bind:result={r.new} size={2} useColors=true></ScrollingNumber>
    {/each}
</div>
{/if}


<div class="buttons">
    <input type="button" class="button-styled" value="Tira i dadi" on:click={reroll} on:mouseout={outFunc} on:blur={outFunc}>
    {#if show}
    <div class="tooltip">
        <button class="button-styled" on:click={toClipboard} transition:animate>
            <span class="tooltiptext" id="tooltip">Copy to clipboard</span>
            Copia i risultati
        </button>
    </div>
    {/if}
</div>

<style>
    .rolls{
        margin: 20px 0;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .buttons{
        margin: 20px 0 0;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .tooltip {
        position: relative;
        display: inline-block;
    }

    .tooltip .tooltiptext {
        visibility: hidden;
        width: 140px;
        background-color: #555;
        color: #fff;
        text-align: center;
        border-radius: 6px;
        padding: 5px;
        position: absolute;
        z-index: 1;
        bottom: 150%;
        left: 50%;
        margin-left: -75px;
        opacity: 0;
        transition: opacity 0.3s;
    }

    .tooltip .tooltiptext::after {
        content: "";
        position: absolute;
        top: 100%;
        left: 50%;
        margin-left: -5px;
        border-width: 5px;
        border-style: solid;
        border-color: #555 transparent transparent transparent;
    }

    .tooltip:hover .tooltiptext {
        visibility: visible;
        opacity: 1;
    }

</style>