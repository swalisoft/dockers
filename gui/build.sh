auth=$(xauth list);

eval "docker build -t rnative --build-arg X_AUTH='$auth' .";
