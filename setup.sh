# TRAEFIK_SETUP

""


# AUTHENTIK SETUP

# Generate avatars based on usernames (see https://docs.goauthentik.io/docs/sys-mgmt/settings#avatars)
echo "AUTHENTIK_AVATARS=initials" >> Networking/authentik/.env

# Settings for air-gapped environments/privacy (see https://docs.goauthentik.io/docs/install-config/air-gapped)
echo "AUTHENTIK_DISABLE_STARTUP_ANALYTICS=true" >> Networking/authentik/.env
echo "AUTHENTIK_DISABLE_UPDATE_CHECK=true" >> Networking/authentik/.env
echo "AUTHENTIK_ERROR_REPORTING__ENABLED=false" >> Networking/authentik/.env

# Configure secure passwords (see https://docs.goauthentik.io/docs/install-config/install/docker-compose#preparation)
echo "PG_PASS=$(openssl rand -base64 64 | tr -d '\n')" >> Networking/authentik/.env
echo "AUTHENTIK_SECRET_KEY=$(openssl rand -base64 64 | tr -d '\n')" >> Networking/authentik/.env

# Set initial akadmin password for secure deployment (e-mail optional)
# echo "AUTHENTIK_BOOTSTRAP_EMAIL=your@email.com" >> Networking/authentik.env
echo "AUTHENTIK_BOOTSTRAP_PASSWORD=$(openssl rand -base64 64 | tr -d '\n')" >> Networking/authentik/.env


# PIHOLE SETUP

echo "PIHOLE_PASSWORD=$(openssl rand -base64 64 | tr -d '\n')" >> Networking/pihole/.env


# MINIO SETUP

# echo "MINIO_ROOT_USER=coolname >> Development/minio/.env
echo "MINIO_ROOT_PASSWORD=$(openssl rand -base64 64 | tr -d '\n')" >> Development/minio/.env
