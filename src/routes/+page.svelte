<script>

	import Month from "$lib/components/month.svelte";
import moment from "moment";

</script>
<div class="page">
    <div class="mx-auto w-[30rem] text-base">
        <div class=" grid grid-cols-3 grid-rows-4 h-full w-full gap-2">
            {#each Array(12) as _, i}
                <Month month={i + 1}/>
            {/each}
           
        </div>
    </div>
</div>

<div class="page">
    <div class="mx-auto w-[30rem] text-base">
        <h1 class="font-bold text-center uppercase">Theme</h1>
        <div class=" border-2 border-base h-8"></div>
        <h1 class="font-bold text-center uppercase">Description</h1>
        <div class="dot-background h-40 border-2 border-base"></div>
    </div>
</div>

<style>
	
</style>
