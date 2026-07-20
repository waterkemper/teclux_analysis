# Separate PostgreSQL with pgvector for AI projections

The legacy PostgreSQL 9.5 database remains the source of truth, while each customer installation runs a separate modern PostgreSQL service with pgvector on the same server for rebuildable AI projections and transversal AI administration. This avoids risking the legacy ERP or scanning vectors in PHP, keeps AI failures isolated, and supports versioned HNSW indexes; the two services use separate ports, data directories, users, resources, migrations and backups.
