FROM alpine as downloader
ENV BFG_VERSION=1.14.0
RUN wget -q -O bfg.jar https://repo1.maven.org/maven2/com/madgag/bfg/${BFG_VERSION}/bfg-${BFG_VERSION}.jar
FROM gcr.io/distroless/java
COPY --from=downloader /bfg.jar /
ENTRYPOINT ["java", "-jar", "/bfg.jar"]
CMD ["--help"]
