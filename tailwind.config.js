const defaultTheme = require("tailwindcss/defaultTheme");
const colors = require("tailwindcss/colors");

module.exports = {
  content: ["./src/**/*.css", "./src/**/*.cr", "./src/**/*.ts"],
  theme: {
    extend: {
        animation: {
            marquee: 'marquee 31s linear infinite',
        },
        keyframes: {
            marquee: {
                '0%': { transform: 'translateX(100%)' },
                '100%': { transform: 'translateX(-250%)' },
            }
        },
        colors: {
            primary: colors.rose,
        },
        fontFamily: {
            sans: ["Inter var", ...defaultTheme.fontFamily.sans],
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
