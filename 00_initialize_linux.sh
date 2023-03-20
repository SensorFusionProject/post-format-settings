sudo apt-get update -y && sudo apt-get install -q -y \
	vim \
	python3-pip \
	wget \
	build-essential gdb clang lldb g++-10 \
	python3 \
	git \
&& sudo apt-get clean && sudo rm -rf /var/lib/apt/lists/*
