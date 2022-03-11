EXECUTABLE=SportsbookBFFLambda
LAMBDA_ZIP=lambda.zip

SWIFT_DOCKER_IMAGE=builder

build_lambda:
	docker build -f Dockerfile.builder . -t builder

	docker run \
			--rm \
			--volume "$(shell pwd):/src" \
			--workdir "/src" \
			$(SWIFT_DOCKER_IMAGE) \
			swift build --product $(EXECUTABLE) -c release

package_lambda: build_lambda
	docker run \
			--rm \
			--volume "$(shell pwd):/src" \
			--workdir "/src" \
			$(SWIFT_DOCKER_IMAGE) \
			scripts/package.sh $(EXECUTABLE)
