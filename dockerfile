FROM  python:3.12

ADD . /detection_rules

WORKDIR /detection_rules

RUN pip3 install ".[dev]"
RUN pip3 install lib/kibana lib/kql

RUN printf '#!/usr/bin/env bash\npython -m detection_rules "$@"\n' > /usr/local/bin/detection_rules \
    && chmod +x /usr/local/bin/detection_rules

VOLUME [ "/detection_rules" ]



CMD [ "detection_rules","-h" ]