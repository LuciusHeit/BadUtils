<script>
	import { fade } from 'svelte/transition';
	export let timeout;
	let transitioning = false;
	
	change();
	
	function change() {
		transitioning = true;
		setTimeout(() => {
			transitioning = false;
		}, timeout);
	}
</script>

{#if !transitioning}
	<div transition:fade={{duration: 200}}>
		<slot></slot>
	</div>
{/if}