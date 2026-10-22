# 📌 Proxecto Albergues - Dockerizado con PostgreSQL e Adminer

Este proxecto automatiza o despregue dunha base de datos **PostgreSQL 17** coa táboa e os datos iniciais de 8 albergues do Camiño de Santiago, xunto cunha interface gráfica **Adminer 4** para xestionala de xeito sinxelo.

---

## 🛠️ Requisitos Previos

Antes de arrincar, asegúrate de ter instalado no teu sistema:
* [Docker Desktop](https://www.docker.com/products/docker-desktop/)
* Git (opcional, para clonar o repositorio)

---

## 🚀 Guía de Arranque Paso a Paso (desde WSL)

Sigue estes pasos ordenados desde a túa terminal de WSL para poñer en marcha a contorna:

### Paso 1: Acceder ao cartafol do proxecto
Móvete ata o directorio onde tes gardados os ficheiros. Lembra que se os tes no teu disco local `C:`, en WSL accédese a través da ruta `/mnt/c/`:
```bash
cd /mnt/c/ruta/ao/teu/cartafol/proxecto
```

### Paso 2: Crear o arquivo de configuración `.env`
Por seguridade, as credenciais secretas da base de datos están protexidas no ficheiro `.gitignore` para non subilas nunca a internet. 

Crea unha copia do arquivo de exemplo `.env.example` e renoméao como `.env` usando o comando nativo de Linux:
```bash
cp .env.example .env
```

### Paso 3: Configurar os teus datos secretos
Abre o novo arquivo `.env` para editalo. Podes usar editores integrados na terminal como `nano` ou abrir o teu Visual Studio Code de Windows directamente desde WSL:
```bash
code .env
```
Define as túas credenciais propias gardando o arquivo con este formato:
```env
USUARIO=o_teu_usuario_seguro
CONTRASINAL=o_teu_contrasinal_secreto
BASE_DATOS=bd_albergues
```

### Paso 4: Levantar os contedores
Executa o comando de Docker Compose para descargar as imaxes e arrincar os servizos en segundo plano (`-d`). 

*(Nota: Asegúrate de ter o programa Docker Desktop aberto en Windows e coa opción de integración con WSL activada).*
```bash
docker compose up -d
```

> ⏳ **Nota sobre a automatización:** Grazas ao `healthcheck` que configuramos, o servizo de Adminer non se activará de todo ata que PostgreSQL remate de executar os scripts de inicialización `01_esquema.sql` e `02_datos.sql` que están dentro do cartafol `sql/`.


### Paso 5: Acceder á interface gráfica (Adminer)
1. Abre o teu navegador e entra en: [http://localhost:8080](http://localhost:8080)
2. Verás que o campo **Servidor** xa vén cuberto automaticamente como `db`.
3. Introduce o **Usuario**, **Contrasinal** e **Base de datos** que definiches no teu arquivo `.env`.
4. ¡Listo! Xa podes explorar a táboa `albergues`.

---

## 💾 Proba de Persistencia (Paso a Paso)

Unha das características máis importantes deste deseño é que **os datos non se perden** cando o contedor se apaga ou se destrúe, grazas ao volume nomeado de Docker `postgres_datos`.

### Táboa de Resultados do Test

| Nº Paso | Acción Realizada | Resultado obtido |
| :---: | :--- | :--- |
| **1** | `docker compose up -d` |  |
| **2** | Inserción manual en Adminer |  |
| **3** | `docker compose down` e `docker compose up -d` |  | 
| **4** |  `docker compose down -v` e `docker compose up -d` |  | 

### Por que no paso 4 o resultado é distinto?


