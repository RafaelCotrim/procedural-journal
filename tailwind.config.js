import * as theme from 'tailwindcss/defaultTheme'

console.log(theme.colors.grey)

/** @type {import('tailwindcss').Config} */
export default {
  content: ['./src/**/*.{html,js,svelte,ts}'],
  theme: {
    extend: {
      colors:{
        base:  {
          DEFAULT: "rgb(var(--color-base))"
        }
      },
    },
  },
  plugins: [],
}

