# UltroidCli
# Copyright (C) 2021 Akash Pattnaik
#
# This file is a part of < https://github.com/BLUE-DEVIL1134/UltroidCli/ >
# PLease read the GNU Affero General Public License in
# <https://www.github.com/BLUE-DEVIL1134/UltroidCli/blob/main/LICENSE/>.

FROM programmingerror/ultroid:b0.1

# Set Timezone
ENV TZ=Asia/Kolkata
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install UltroidCli ( change {version} with the latest release version )
RUN curl "https://github.com/BLUE-DEVIL1134/UltroidCli/releases/download/{version}/ultroid.exe" -o ultroid

# Clone the repository and install the dependencies
RUN ./ultroid init

# Create a new [.env] file
RUN ./ultroid env.create new

# Set the Variables in [.env] file
RUN ./ultroid env.set API_ID $apiId
RUN ./ultroid env.set API_HASH $apiHash
RUN ./ultroid env.set SESSION $session
RUN ./ultroid env.set REDIS_URI $redisUri
RUN ./ultroid env.set REDIS_PASSWORD $redisPassword

# Print the versions
RUN ./ultroid version

# Run Ultroid
CMD ["./ultroid", "run"]
