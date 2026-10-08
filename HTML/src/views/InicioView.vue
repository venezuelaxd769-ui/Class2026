<template>
    <main class="home-container">
        <section class="carousel-section" aria-roledescription="carousel" aria-label="Galería de imágenes destacadas"
            @mouseenter="pauseAutoplay" @mouseleave="startAutoplay">
            <!-- Contenedor con overflow oculto -->
            <div class="carousel-viewport">
                <!-- Pista que se desplaza -->
                <div class="carousel-track" :style="trackStyle" @transitionend="handleTransitionEnd">
                    <figure v-for="(imgSrc, index) in displaySlides" :key="`${imgSrc}-${index}`" class="carousel-slide">
                        <img :src="imgSrc" :alt="`Slide ${index}`" loading="lazy" />
                    </figure>
                </div>
            </div>
            
            <!-- Botón anterior (Izquierda) -->
            <button type="button" class="carousel-control prev" @click="prevSlide" aria-label="Imagen anterior">
                &#10094;
            </button>

            <!-- Botón siguiente (Derecha) -->
            <button type="button" class="carousel-control next" @click="nextSlide" aria-label="Imagen siguiente">
                &#10095;
            </button>
        </section>
    </main>
</template>

<script>
export default {
    name: 'InicioView',
    data() {
        return {
            // Array dinámico de tamaño n
            slides: [
                "https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=1600&q=80",
                "https://images.unsplash.com/photo-1511884642898-4c92249e20b6?auto=format&fit=crop&w=1600&q=80",
                "https://images.unsplash.com/photo-1470071459604-3b5ec3a7fe05?auto=format&fit=crop&w=1600&q=80",
                "https://images.unsplash.com/photo-1447752875215-b2761acb3c5d?auto=format&fit=crop&w=1600&q=80"
            ],
            // Iniciamos en 1 debido al clon del último elemento al inicio
            currentIndex: 1,
            isTransitioning: true,
            autoplayTimer: null,
            transitionDuration: 500 // ms
        };
    },
    computed: {
        // Genera el arreglo con clones para el loop infinito: [Último, ...slides, Primero]
        displaySlides() {
            if (!this.slides || this.slides.length === 0) return [];
            if (this.slides.length === 1) return this.slides;

            const firstClone = this.slides[0];
            const lastClone = this.slides[this.slides.length - 1];
            return [lastClone, ...this.slides, firstClone];
        },
        // Estilos reactivos aplicados al track
        trackStyle() {
            return {
                transform: `translateX(-${this.currentIndex * 100}%)`,
                transition: this.isTransitioning
                    ? `transform ${this.transitionDuration}ms ease-in-out`
                    : 'none'
            };
        }
    },
    methods: {
        nextSlide() {
            if (this.slides.length <= 1) return;
            this.isTransitioning = true;
            this.currentIndex++;
        },
        prevSlide() {
            if (this.slides.length <= 1) return;
            this.isTransitioning = true;
            this.currentIndex--;
        },

        handleTransitionEnd() {
            // Si llega al clon final, salta instantáneamente al primer slide real
            if (this.currentIndex === this.displaySlides.length - 1) {
                this.isTransitioning = false;
                this.currentIndex = 1;
            }
            // Si llega al clon inicial, salta instantáneamente al último slide real
            if (this.currentIndex === 0) {
                this.isTransitioning = false;
                this.currentIndex = this.displaySlides.length - 2;
            }
        },
        
        startAutoplay() {
            if (this.slides.length <= 1) return;
            this.clearAutoplay();
            this.autoplayTimer = setInterval(() => {
                this.nextSlide();
            }, 4000);
        },
        pauseAutoplay() {
            this.clearAutoplay();
        },
        clearAutoplay() {
            if (this.autoplayTimer) {
                clearInterval(this.autoplayTimer);
                this.autoplayTimer = null;
            }
        }
    },
    mounted() {
        this.startAutoplay();
    },
    beforeUnmount() {
        this.clearAutoplay();
    }
};
</script>

<style scoped>
/* Reset de caja y contenedor principal */
.home-container {
    width: 100%;
}

.carousel-section {
    position: relative;
    width: 100%;
    height: 500px;
    overflow: hidden;
    user-select: none;
    background-color: #000;
}

.carousel-viewport {
    width: 100%;
    height: 100%;
    overflow: hidden;
}

.carousel-track {
    display: flex;
    width: 100%;
    height: 100%;
    will-change: transform;
}

.carousel-slide {
    flex: 0 0 100%;
    width: 100%;
    height: 100%;
    margin: 0;
    padding: 0;
}

.carousel-slide img {
    display: block;
    width: 100%;
    height: 100%;
    object-fit: cover;
    pointer-events: none;
}

/* Controles de navegación */
.carousel-control {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    width: 50px;
    height: 50px;
    border-radius: 50%;
    background-color: rgba(0, 0, 0, 0.45);
    color: #ffffff;
    border: none;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 24px;
    z-index: 10;
    transition: background-color 0.3s ease, transform 0.2s ease;
}

.carousel-control:hover {
    background-color: rgba(0, 0, 0, 0.8);
    transform: translateY(-50%) scale(1.08);
}

.carousel-control:focus-visible {
    outline: 2px solid #ffffff;
}

.carousel-control.prev {
    left: 15px;
}

.carousel-control.next {
    right: 15px;
}

/* Media Queries para Tablet y Móvil */
@media (max-width: 768px) {
    .carousel-section {
        height: 360px;
    }

    .carousel-control {
        width: 42px;
        height: 42px;
        font-size: 20px;
    }
}

@media (max-width: 576px) {
    .carousel-section {
        height: 260px;
    }

    .carousel-control {
        width: 36px;
        height: 36px;
        font-size: 16px;
    }

    .carousel-control.prev {
        left: 8px;
    }

    .carousel-control.next {
        right: 8px;
    }
}
</style>