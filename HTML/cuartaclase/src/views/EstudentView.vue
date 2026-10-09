<template>
  <section class="container">
    <h1>Estudiantes</h1>

    <form class="card" @submit.prevent="saveStudent">
      <h2>Nuevo estudiante</h2>

      <label>
        Documento
        <input v-model="form.documento" type="text" inputmode="numeric" required />
      </label>

      <label>
        Nombre
        <input v-model="form.nombre" type="text" maxlength="155" />
      </label>

      <label class="check">
        <input v-model="form.active" type="checkbox" />
        Activo
      </label>

      <button type="submit" :disabled="saving">
        {{ saving ? 'Guardando...' : 'Guardar' }}
      </button>
    </form>

    <p v-if="error" class="msg error">{{ error }}</p>
    <p v-if="success" class="msg ok">{{ success }}</p>

    <div class="card">
      <div class="header">
        <h2>Listado</h2>
        <button type="button" :disabled="loading" @click="getAllStudents">Recargar</button>
      </div>

      <p v-if="loading">Cargando...</p>
      <p v-else-if="!students.length">No hay estudiantes registrados.</p>

      <table v-else>
        <thead>
          <tr>
            <th>Documento</th>
            <th>Nombre</th>
            <th>Estado</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="s in students" :key="s.documento">
            <td>{{ s.documento }}</td>
            <td>{{ s.nombre }}</td>
            <td>
              <span :class="['badge', s.active ? 'on' : 'off']">
                {{ s.active ? 'Activo' : 'Inactivo' }}
              </span>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </section>
</template>

<script>
import axios from 'axios'

const API_URL = import.meta.env.VITE_API_URL || 'http://localhost:3000'

export default {
  name: 'EstudentView',

  data() {
    return {
      students: [],
      loading: false,
      saving: false,
      error: '',
      success: '',
      form: {
        documento: '',
        nombre: '',
        active: true,
      },
    }
  },

  mounted() {
    this.getAllStudents()
  },

  methods: {
    // 1) Consulta todos los estudiantes (GET /getallstudents)
    async getAllStudents() {
      this.loading = true
      this.error = ''
      try {
        const { data } = await axios.get(`${API_URL}/getallstudents`)
        this.students = data
      } catch (e) {
        this.error = e.response?.data?.error || 'No se pudo cargar la lista de estudiantes'
      } finally {
        this.loading = false
      }
    },

    // 2) Inserta un estudiante nuevo (POST /savestudent)
    async saveStudent() {
      this.error = ''
      this.success = ''

      if (!/^\d+$/.test(String(this.form.documento))) {
        this.error = 'El documento es obligatorio y debe ser numérico'
        return
      }

      this.saving = true
      try {
        await axios.post(`${API_URL}/savestudent`, {
          documento: this.form.documento,
          nombre: this.form.nombre,
          active: this.form.active,
        })

        this.success = 'Estudiante guardado correctamente'
        this.form = { documento: '', nombre: '', active: true }
        await this.getAllStudents()
      } catch (e) {
        this.error = e.response?.data?.error || 'Error al guardar el estudiante'
      } finally {
        this.saving = false
      }
    },
  },
}
</script>

<style scoped>
.container { max-width: 720px; margin: 2rem auto; padding: 0 1rem; font-family: system-ui, sans-serif; }
.card { border: 1px solid #ddd; border-radius: 8px; padding: 1rem 1.25rem; margin-bottom: 1.25rem; }
.header { display: flex; justify-content: space-between; align-items: center; }
form { display: flex; flex-direction: column; gap: 0.75rem; }
label { display: flex; flex-direction: column; gap: 0.25rem; font-size: 0.9rem; }
label.check { flex-direction: row; align-items: center; gap: 0.5rem; }
input[type='text'] { padding: 0.5rem; border: 1px solid #ccc; border-radius: 4px; }
button { padding: 0.5rem 1rem; border: 0; border-radius: 4px; background: #2563eb; color: #fff; cursor: pointer; }
button:disabled { opacity: 0.6; cursor: not-allowed; }
table { width: 100%; border-collapse: collapse; }
th, td { text-align: left; padding: 0.5rem; border-bottom: 1px solid #eee; }
.badge { padding: 0.125rem 0.5rem; border-radius: 999px; font-size: 0.8rem; }
.badge.on { background: #dcfce7; color: #166534; }
.badge.off { background: #fee2e2; color: #991b1b; }
.msg { padding: 0.5rem 0.75rem; border-radius: 4px; }
.msg.error { background: #fee2e2; color: #991b1b; }
.msg.ok { background: #dcfce7; color: #166534; }
</style>
