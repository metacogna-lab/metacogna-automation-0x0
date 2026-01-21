# Governance & Security Policy

## 1. Zero Secrets in Workflows
**Hard Rule**: No sensitive credentials (API keys, passwords, tokens) shall be hardcoded in n8n workflow JSON files.

### Enforcement
- CI/CD pipeline runs `grep` checks for `credentials` blocks in JSON.
- All secrets must be managed via n8n's **Credential Store**.
- In Production, `n8n` runs with `N8N_ENCRYPTION_KEY` to secure the credential store.

## 2. Secrets Rotation
Key rotation is critical for maintaining security.

### Procedure
1. **Identify**: List all credentials used in `docker/prod/docker-compose.yml` and n8n Credential Store.
2. **Rotate**:
    - Update the provider side (e.g., generate new OpenAI Key).
    - Update the ENV var in your deployment system (GitHub Secrets, Portainer, etc.).
    - Update n8n Credential Store via the UI (if manually managed) or API.
3. **Verify**: Run the `deploy-dev` pipeline to ensure new secrets work.

## 3. Access Control
- **Production Editor**: STRICTLY LOCKED. No editing in Prod.
    - `N8N_EDITOR_ENABLED=false` (or guarded via Auth).
    - `WEBHOOK_URL` is the only public entry point.
- **Development**: Open for editing, but data is ephemeral.

## 4. Workflow Promotion
1. **Dev**: Build and test.
2. **PR**: Submit Pull Request. CI validates JSON and checks for secrets.
3. **Merge**: code is merged to `main`.
4. **Deploy**: Tag release `v*` to deploy to Prod.
