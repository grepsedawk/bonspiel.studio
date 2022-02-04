const defaultTheme = require("tailwindcss/defaultTheme");
const colors = require("tailwindcss/colors");

module.exports = {
  content: ["./src/**/*.css", "./src/**/*.cr", "./src/**/*.ts"],
  theme: {
    extend: {
        animation: {
            'slide-in': 'slide-in 1.0s ease-in-out',
        },
        keyframes: {
            'slide-in': {
                '0%': { transform: 'translateY(100%)' },
                '100%': { transform: 'translateY(0%)' }
            },
        },
        colors: {
            primary: colors.rose,
        },
    },
  },
  plugins: [
    require("@tailwindcss/forms"),
    require("@tailwindcss/typography"),
    require("@tailwindcss/aspect-ratio"),
    require("tailwindcss-font-inter"),
    require('daisyui'),
  ],
};
