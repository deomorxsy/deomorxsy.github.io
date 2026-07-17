.PHONY: builda
builda:
    CCR_MODE="checker" . ./scripts/ccr.sh && \
		docker compose -f ./compose.yaml --progress=plain build builder
