// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
//import "../css/app.css" Removed to allow Tailwind to operate smoothly

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import deps with the dep name or local files with a relative path, for example:
//
//     import {Socket} from "phoenix"
//     import socket from "./socket"
//
import "phoenix_html"
import Alpine from "alpinejs";

// Add this before your liveSocket call.
window.Alpine = Alpine;
Alpine.data('data_scope', () => {
    function getThemeFromLocalStorage() {
        // if user already changed the theme, use it
        if (window.localStorage.getItem('dark')) {
          return JSON.parse(window.localStorage.getItem('dark'))
        }
    
        // else return their preferences
        return (
          !!window.matchMedia &&
          window.matchMedia('(prefers-color-scheme: dark)').matches
        )
      }
    
      function setThemeToLocalStorage(value) {
        window.localStorage.setItem('dark', value)
      }
    
      return {
        dark: getThemeFromLocalStorage(),
        toggleTheme() {
          this.dark = !this.dark
          setThemeToLocalStorage(this.dark)
        },
        isSideMenuOpen: false,
        toggleSideMenu() {
          this.isSideMenuOpen = !this.isSideMenuOpen
        },
        closeSideMenu() {
          this.isSideMenuOpen = false
        },
        isNotificationsMenuOpen: false,
        toggleNotificationsMenu() {
          this.isNotificationsMenuOpen = !this.isNotificationsMenuOpen
        },
        closeNotificationsMenu() {
          this.isNotificationsMenuOpen = false
        },
        isProfileMenuOpen: false,
        toggleProfileMenu() {
          this.isProfileMenuOpen = !this.isProfileMenuOpen
        },
        closeProfileMenu() {
          this.isProfileMenuOpen = false
        },
        isPagesMenuOpen: false,
        togglePagesMenu() {
          this.isPagesMenuOpen = !this.isPagesMenuOpen
        },
        // Modal
        isModalOpen: false,
        trapCleanup: null,
        openModal() {
          this.isModalOpen = true
          this.trapCleanup = focusTrap(document.querySelector('#modal'))
        },
        closeModal() {
          this.isModalOpen = false
          this.trapCleanup()
        },
      }
}

)
Alpine.start();
 
 