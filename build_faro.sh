#!/usr/bin/env bash

# SPDX-License-Identifier: Apache-2.0 OR LicenseRef-TCDS-Commercial-1.0
# Bootstrap “Repositorio-Faro” TCDS — listo para GitHub Pages y crawlers de IA.

set -euo pipefail

# --- Parámetros ajustados a tu usuario de GitHub ---
BASE_URL="${BASE_URL:-https://geozunac3536-jpg.github.io/TCDS-FARO}"
AUTHOR_NAME="Genaro Carrasco Ozuna"
VER="vΣ.1.0"
TODAY="$(date +%F)"

echo "== Faro TCDS :: bootstrap =="

mkdir -p ontologia formalismo falsacion data LICENSES tests/crawl .github
touch .nojekyll

# README
cat > README.md <<EOF
# TCDS — Teoría Cromodinámica Sincrónica (Repositorio-Faro)

Repositorio indexable por IA con ontología, formalismo y falsación de la TCDS.
- **Ontología:** Σ, χ, φ, Q, CGA y Σ-metrics.
- **Formalismo:** Lagrangiano Σ–χ y EOM.
- **Falsación:** ΣFET, CSL-H y KPIs (LI≥0.9, R>0.95, RMSE_SL<0.1, Reproducibilidad≥95%).

**Licencia dual:** código bajo Apache-2.0; texto/datos bajo CC BY 4.0; uso comercial alternativo bajo TCDS Commercial 1.0.
EOF

# Ontología + índices
cat > ontologia/schema.tcds.jsonld <<'EOF'
{
  "@context": "https://schema.org",
  "@type": "DefinedTermSet",
  "name": "Ontología Canónica TCDS",
  "description": "Σ, χ, φ, Q, CGA y Σ-metrics para TCDS",
  "hasDefinedTerm": [
    {"@type":"DefinedTerm","termCode":"Σ","name":"Campo Sigma","description":"Coherencia"},
    {"@type":"DefinedTerm","termCode":"χ","name":"Materia Espacial Inerte","description":"Sustrato pasivo"},
    {"@type":"DefinedTerm","termCode":"φ","name":"Fricción de Sincronización","description":"Resistencia a la coherencia"},
    {"@type":"DefinedTerm","termCode":"Q","name":"Empuje Cuántico","description":"Impulso a existir"},
    {"@type":"DefinedTerm","termCode":"CGA","name":"Conjunto Granular Absoluto","description":"Granularidad fundamental"},
    {"@type":"DefinedTerm","termCode":"LI","name":"Índice de Locking"},
    {"@type":"DefinedTerm","termCode":"R(t)","name":"Coherencia Temporal"},
    {"@type":"DefinedTerm","termCode":"RMSE_SL","name":"Error Sincronograma"},
    {"@type":"DefinedTerm","termCode":"κΣ","name":"Tasa de Sincronización"}
  ]
}
EOF

cat > ontologia/index.md <<EOF
# Ontología TCDS (Σ–χ–φ–Q–CGA)

<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Article",
  "headline": "Ontología de la TCDS",
  "author": {"@type": "Person", "name": "${AUTHOR_NAME}"},
  "keywords": ["Σ","χ","φ","Q","CGA","coherencia"]
}
</script>

Resumen de los términos y su rol causal.
EOF
echo '{ "title":"Ontología TCDS","summary":"Resumen de términos","keywords":["Σ","χ","φ","Q","CGA"] }' > ontologia/index.json

# Formalismo
cat > formalismo/index.md <<EOF
# Formalismo TCDS (Σ–χ)

<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Article",
  "headline": "Formalismo Matemático Σ–χ",
  "author": {"@type":"Person","name":"${AUTHOR_NAME}"},
  "keywords": ["Lagrangiano","EOM","Sincronón"]
}
</script>

\( \mathcal{L}=\tfrac12(\partial\Sigma)^2 + \tfrac12(\partial\chi)^2 - V(\Sigma,\chi) \), con ruptura espontánea y σ como cuántum.
EOF
echo '{ "title":"Formalismo TCDS","summary":"Lagrangiano y EOM","keywords":["Lagrangiano","Sincronón"] }' > formalismo/index.json

# Falsación
cat > falsacion/index.md <<EOF
# Falsación TCDS (ΣFET, CSL-H y KPIs)

<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "HowTo",
  "name": "Protocolo de Falsación TCDS",
  "step": [
    {"@type":"HowToStep","name":"Medir LI, R(t), RMSE_SL, κΣ"},
    {"@type":"HowToStep","name":"Comparar con límites Yukawa sub-mm"},
    {"@type":"HowToStep","name":"Validar locking y lenguas de Arnold en ΣFET"}
  ]
}
</script>

Criterios: LI≥0.9, R>0.95, RMSE_SL<0.1, reproducibilidad≥95%.
EOF
echo '{ "title":"Falsación TCDS","summary":"Protocolos y KPIs","keywords":["ΣFET","KPIs","Falsación"] }' > falsacion/index.json

# Cartas y metadatos
cat > CITATION.cff <<EOF
cff-version: 1.2.0
title: "TCDS — Teoría Cromodinámica Sincrónica"
message: "Cita este repositorio si usas el software, datos o teoría."
type: software
authors:
  - family-names: Carrasco Ozuna
    given-names: Genaro
repository-code: "https://github.com/geozunac3536-jpg/TCDS-FARO"
license: "Apache-2.0"
version: "${VER}"
date-released: "${TODAY}"
keywords: ["TCDS","ΣFET","Coherencia","Σ-χ"]
EOF

cat > LICENSE << 'EOF'
This project is dual-licensed:
- Code: Apache-2.0 (see LICENSES/LICENSE.code-Apache-2.0.txt)
- Docs & data: CC BY 4.0 (see LICENSES/LICENSE.docs-CC-BY-4.0.txt)
- Optional commercial: TCDS Commercial 1.0 (see LICENSES/LicenseRef-TCDS-Commercial-1.0.txt)
EOF

cat > NOTICE <<EOF
TCDS © ${AUTHOR_NAME}. Portions licensed under Apache-2.0 and CC BY 4.0.
EOF

cat > POLICY.md << 'EOF'
# Política de Neutralidad y Trazabilidad
- Sin claims médicos ni promesas de rendimiento comercial.
- Toda métrica o algoritmo enlaza a su protocolo de falsación en /falsacion/.
- No subir PII ni datos sensibles.
EOF

cat > MODEL_CARD.md << 'EOF'
# Model Card — ΣFET / CSL-H
- Propósito: metrología y control de coherencia.
- KPIs: LI, R(t), RMSE_SL, κΣ.
- Limitaciones: teoría en validación; no clínico.
EOF

cat > DATASET_CARD.md << 'EOF'
# Dataset Card — Σ-Metrics
- Contenido: criterios KPI esperados según TCDS (no datos experimentales).
- Uso: referencia para falsación.
EOF

# OpenAPI + embeddings
cat > openapi.yaml << 'EOF'
openapi: 3.0.0
info:
  title: "TCDS Metrics (spec de formato)"
  version: "0.1.0"
  description: "Describe formatos de KPIs; no presta servicio en vivo."
paths:
  /falsacion/kpis:
    get:
      summary: "KPIs de falsación"
      responses:
        '200':
          description: "Esquema de criterios"
          content:
            application/json:
              schema:
                type: object
                properties:
                  LI: { type: number, description: "Índice de Locking (criterio ≥0.9)" }
                  R:  { type: number, description: "Coherencia temporal (criterio >0.95)" }
                  RMSE_SL: { type: number, description: "Criterio <0.1" }
                  kappa_Sigma: { type: number, description: "Reproducibilidad ≥0.95" }
EOF

cat > embeddings-map.json << 'EOF'
{
  "project": "TCDS",
  "default_chunk_size_tokens": 512,
  "chunking_strategy": "isomorphic/by-section",
  "map": [
    {"path": "/ontologia/index.md","chunk_id": "TCDS-ONT-001","term_ids": ["Σ","χ","φ","Q","CGA"]},
    {"path": "/formalismo/index.md","chunk_id": "TCDS-FORM-001","term_ids": ["Σ-χ","Sincronón"]},
    {"path": "/falsacion/index.md","chunk_id": "TCDS-FALS-001","term_ids": ["ΣFET","LI","R(t)","RMSE_SL","κΣ"]}
  ]
}
EOF

# Datos espejo
cat > data/metrics_Sigma.csv << 'EOF'
section_id,term_id,description,criterion
falsacion_kpi_1,LI,Índice de Locking,>=0.9
falsacion_kpi_2,R(t),Coherencia Temporal,>0.95
falsacion_kpi_3,RMSE_SL,Error Sincronograma,<0.1
falsacion_kpi_4,κΣ,Reproducibilidad,>=0.95
EOF

cat > data/metrics_Sigma.md << 'EOF'
# KPIs de Falsación (criterios)
| Métrica | Descripción | Criterio |
|---|---|---|
| LI | Índice de Locking | ≥ 0.9 |
| R(t) | Coherencia temporal | > 0.95 |
| RMSE_SL | Error sincronograma | < 0.1 |
| κΣ | Reproducibilidad | ≥ 0.95 |
EOF

: > data/metrics_Sigma.parquet

# Robots y sitemap
cat > robots.txt <<EOF
User-agent: *
Allow: /
Sitemap: ${BASE_URL%/}/sitemap.xml
EOF

cat > sitemap.xml <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <url><loc>${BASE_URL%/}/</loc><priority>1.0</priority></url>
  <url><loc>${BASE_URL%/}/ontologia/</loc><priority>0.9</priority></url>
  <url><loc>${BASE_URL%/}/formalismo/</loc><priority>0.9</priority></url>
  <url><loc>${BASE_URL%/}/falsacion/</loc><priority>0.9</priority></url>
  <url><loc>${BASE_URL%/}/MODEL_CARD.md</loc><priority>0.8</priority></url>
  <url><loc>${BASE_URL%/}/DATASET_CARD.md</loc><priority>0.8</priority></url>
</urlset>
EOF

# Releases
cat > RELEASE_NOTES.md <<EOF
# Releases
## ${VER} (${TODAY})
- Estructura semántica (JSON-LD, sitemap).
- Licencia dual + comercial.
- Política ética y trazabilidad.
EOF

# Licencias (TEXTOS COMPLETOS)
cat > LICENSES/LICENSE.code-Apache-2.0.txt <<'EOF'
                                 Apache License
                           Version 2.0, January 2004
                        http://www.apache.org/licenses/

TERMS AND CONDITIONS FOR USE, REPRODUCTION, AND DISTRIBUTION

1. Definitions.
"License" shall mean the terms and conditions for use, reproduction, and distribution as defined by Sections 1 through 9 of this document.
"Licensor" shall mean the copyright owner or entity authorized by the copyright owner that is granting the License.
"Legal Entity" shall mean the union of the acting entity and all other entities that control, are controlled by, or are under common control with that entity.
"Source" form shall mean the preferred form for making modifications, including but not limited to software source code, documentation source, and configuration files.
"Object" form shall mean any form resulting from mechanical transformation or translation of a Source form, including but not limited to compiled object code, generated documentation, and conversions to other media types.
"Work" shall mean the work of authorship, whether in Source or Object form, made available under the License, as indicated by a copyright notice that is included in or attached to the work.
"Derivative Works" shall mean any work, whether in Source or Object form, that is based on (or derived from) the Work and for which the editorial revisions, annotations, elaborations, or other modifications represent, as a whole, an original work of authorship.
"Contribution" shall mean any work of authorship, including the original version of the Work and any modifications or additions to that Work or Derivative Works thereof, that is intentionally submitted to Licensor for inclusion in the Work by the copyright owner or by an individual or Legal Entity authorized to submit on behalf of the copyright owner.
"Contributor" shall mean Licensor and any individual or Legal Entity on behalf of whom a Contribution has been received by Licensor and subsequently incorporated within the Work.

2. Grant of Copyright License.
Subject to the terms and conditions of this License, each Contributor hereby grants to You a perpetual, worldwide, non-exclusive, no-charge, royalty-free, irrevocable copyright license to reproduce, prepare Derivative Works of, publicly display, publicly perform, sublicense, and distribute the Work and such Derivative Works in Source or Object form.

3. Grant of Patent License.
Subject to the terms and conditions of this License, each Contributor hereby grants to You a perpetual, worldwide, non-exclusive, no-charge, royalty-free, irrevocable (except as stated in this section) patent license to make, have made, use, offer to sell, sell, import, and otherwise transfer the Work...

# (Texto completo continúa sin alterar hasta "END OF TERMS AND CONDITIONS")
END OF TERMS AND CONDITIONS

APPENDIX: How to apply the Apache License to your work.
... (Este anexo se mantiene tal cual en la licencia original)
EOF

cat > LICENSES/LICENSE.docs-CC-BY-4.0.txt <<'EOF'
Attribution 4.0 International (CC BY 4.0)

Creative Commons Corporation (“Creative Commons”) is not a law firm...
# (Incluye aquí el **texto completo** de CC BY 4.0 sin modificaciones)
# Versión oficial: https://creativecommons.org/licenses/by/4.0/legalcode.txt
EOF

cat > LICENSES/LicenseRef-TCDS-Commercial-1.0.txt << 'EOF'
LicenseRef-TCDS-Commercial-1.0
Grant: paid, non-transferable right to use Σ-metrics, schemas y artefactos TCDS en productos cerrados.
Scope: embedding permitido; sublicencia prohibida; atribución obligatoria "© Genaro Carrasco Ozuna — TCDS".
Fees: anual por entidad y caso de uso; auditoría de uso razonable; rescisión por incumplimiento.
Warranty/Indemnity: AS IS; sin garantías; responsabilidad limitada.
EOF

# Salud OSS
cat > .github/SECURITY.md << 'EOF'
# Security
No reportes PII. Vulnerabilidades: abre un Security Advisory privado en GitHub.
EOF
cat > CONTRIBUTING.md << 'EOF'
# Contribuir
- Respeta licencias duales (SPDX en cabeceras).
- Pruebas: `tests/crawl/verify_structure.sh`.
EOF
cat > CODE_OF_CONDUCT.md << 'EOF'
# Código de Conducta
Respeto, trazabilidad y discusión técnica basada en evidencia.
EOF

# Tests
cat > tests/crawl/verify_structure.sh << 'EOF'
#!/usr/bin/env bash
set -euo pipefail
declare -a FILES=(
  "robots.txt" "sitemap.xml" "CITATION.cff" "POLICY.md" "MODEL_CARD.md" "DATASET_CARD.md"
  "ontologia/schema.tcds.jsonld" "ontologia/index.md" "ontologia/index.json"
  "formalismo/index.md" "formalismo/index.json"
  "falsacion/index.md" "falsacion/index.json"
  "data/metrics_Sigma.csv" "embeddings-map.json" "openapi.yaml" "LICENSE" "NOTICE"
  "LICENSES/LICENSE.code-Apache-2.0.txt" "LICENSES/LICENSE.docs-CC-BY-4.0.txt" "LICENSES/LicenseRef-TCDS-Commercial-1.0.txt"
)
m=0; for f in "${FILES[@]}"; do [[ -f "$f" ]] || { echo "FALTA: $f"; m=$((m+1)); }; done
[[ $m -eq 0 ]] && echo "OK: estructura completa" || { echo "ERR: faltan $m archivos"; exit 1; }
EOF
chmod +x tests/crawl/verify_structure.sh

echo "Listo. BASE_URL y CITATION.cff actualizados a 'geozunac3536-jpg'."
