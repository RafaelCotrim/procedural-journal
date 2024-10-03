<script lang="ts">
    interface DateInfo{
        day: number,
        weekend?: boolean,
        holyday?: boolean,
        padding?: boolean,
    }

	import moment from 'moment';

	const DAY_LETTERS = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];

	export let year: undefined | Number = undefined;
	export let month: undefined | Number = undefined;

	if (year === undefined) {
		year = moment().year();
	}

	if (month === undefined) {
		month = moment().month() + 1;
	}
    let monthInfo = moment(`${year}-${month}-01`);
	let processInfo = monthInfo.clone();

	let days : DateInfo[]= [];

    // Front padding
    let missingStartDays = monthInfo.weekday();

	for (let i = missingStartDays; i > 0; i--) {
        let pDate = monthInfo.clone().subtract(i, "day")
        days.push({
            day: pDate.date(),
            weekend: pDate.weekday() == 0 || pDate.weekday() == 6,
            padding: true
        })
    }

    // Main days

	for (let i = 0; i < processInfo.daysInMonth(); i++) {
        let pDate = monthInfo.clone().add(i, "day")
		days.push({
            day: pDate.date(),
            weekend: pDate.weekday() == 0 || pDate.weekday() == 6
        })
	}

    processInfo.add(processInfo.daysInMonth() - 1, "d")
    
    // End padding
    
    let missingEndDays = 6 - processInfo.weekday();

    for (let i = 1; i <= missingEndDays; i++) {
        days.push({
            day: i,
            padding: true
        });
    }

</script>

<div>
	<h2 class=" text-center uppercase">Month NAME</h2>

	<div class="grid grid-cols-7">

		{#each Array(7) as _, i}
			<h3 class=" text-xs">{DAY_LETTERS[i % 7]}</h3>
		{/each}

        <!-- {x.padding ? "text-gray-300" : ""} -->
        
		{#each days as x, i}
			<div class=" text-xs  {x.weekend ? "bg-red-100" : ""}">{x.day}</div>
		{/each}
	</div>
</div>
