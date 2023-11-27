<script>
    export let result;
    export let start;
    export let size;
    export let useColors = false;

    
    const RollColors = [
        "#F1E9DA",
        "#EECDCC",
        "#EBB0BE",
        "#D90368",
        "#970B78",
        "#a413d8"
    ]

</script>

{#key result}
<div id="counter" class="animated" style="--result: {(-result)*size-(0.5*(size-1))}em; --start:{(-start)*size-(0.5*(size-1))}em; --size:{size}em">
    <ul class="digits digits-first luckie">
        {#each {length: 7} as _, i}
        {#if useColors}
            <li style="color: {RollColors[i-1]}"> {i}</li>
        {:else}    
            <li> {i}</li>
        {/if}
        {/each}
    </ul>
</div> 

{/key}


<style>

 #counter {
    height: var(--size);
    width: 50px;
    overflow: hidden;
    display: inline-block;
    width: var(--size);
}

.digits {
    list-style-type:none;
    font-size: var(--size);
    line-height: var(--size);
    padding: 0;
}

.digits-first {
    margin-top: var(--start); /* number 4! */
}

.digits {
    animation-duration: 2s;
    animation-timing-function: ease;
    animation-delay: 0.7s;
    animation-fill-mode: forwards;
  
}

.luckie {
    animation-name: luckie;
}

/* Animations */
@keyframes luckie {
    100% {
        margin-top: var(--result);
    }
} 
</style>