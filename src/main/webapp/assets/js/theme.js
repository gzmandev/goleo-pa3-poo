/**
 * theme.js - Sistema Global de Modo Oscuro para GoLeo
 * Permite alternar entre Modo Claro y Modo Oscuro con persistencia en localStorage
 * y soporte para prefers-color-scheme del sistema operativo.
 */

(function () {
    'use strict';

    const STORAGE_KEY = 'goleo-theme';

    /**
     * Obtiene el tema inicial preferido
     */
    function getPreferredTheme() {
        const storedTheme = localStorage.getItem(STORAGE_KEY);
        if (storedTheme === 'dark' || storedTheme === 'light') {
            return storedTheme;
        }
        return window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches
            ? 'dark'
            : 'light';
    }

    /**
     * Aplica el tema al documento y actualiza el botón de alternancia
     */
    function applyTheme(theme) {
        document.documentElement.setAttribute('data-theme', theme);
        document.documentElement.setAttribute('data-bs-theme', theme);
        if (document.body) {
            document.body.setAttribute('data-theme', theme);
            document.body.setAttribute('data-bs-theme', theme);
        }

        updateToggleButtons(theme);
    }

    /**
     * Actualiza el icono y accesibilidad del botón
     */
    function updateToggleButtons(theme) {
        const buttons = document.querySelectorAll('.theme-toggle-btn');
        buttons.forEach(btn => {
            const isDark = theme === 'dark';
            btn.setAttribute('aria-label', isDark ? 'Cambiar a modo claro' : 'Cambiar a modo oscuro');
            btn.setAttribute('title', isDark ? 'Cambiar a modo claro' : 'Cambiar a modo oscuro');
            btn.innerHTML = isDark 
                ? '<i data-lucide="sun" class="text-warning"></i>' 
                : '<i data-lucide="moon"></i>';
        });

        if (window.lucide && typeof window.lucide.createIcons === 'function') {
            window.lucide.createIcons();
        }
    }

    /**
     * Alterna entre modo claro y oscuro
     */
    function toggleTheme() {
        const currentTheme = document.documentElement.getAttribute('data-theme') || 'light';
        const newTheme = currentTheme === 'dark' ? 'light' : 'dark';
        localStorage.setItem(STORAGE_KEY, newTheme);
        applyTheme(newTheme);
    }

    // Exponer función global
    window.toggleGoleoTheme = toggleTheme;

    // Inicializar al cargar el DOM
    document.addEventListener('DOMContentLoaded', () => {
        const activeTheme = getPreferredTheme();
        applyTheme(activeTheme);

        // Asociar eventos a todos los botones con clase theme-toggle-btn o id themeToggleBtn
        document.querySelectorAll('.theme-toggle-btn, #themeToggleBtn').forEach(btn => {
            btn.addEventListener('click', (e) => {
                e.preventDefault();
                toggleTheme();
            });
        });
    });

    // Escuchar cambios de preferencia en el sistema operativo si el usuario no fijó preferencia manual
    if (window.matchMedia) {
        window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', e => {
            if (!localStorage.getItem(STORAGE_KEY)) {
                applyTheme(e.matches ? 'dark' : 'light');
            }
        });
    }
})();
