#!/bin/sh

if test ! "${SUMO_COLLECTOR}"; then
    SUMO_COLLECTOR=endpoint1.collection.eu.sumologic.com
fi

if test ! "${SUMO_URLTOKEN}"; then
    echo "Missing SumoLogic URL"
    exit 1;
fi

sed -i -e "s/%COLLECTOR%/${SUMO_COLLECTOR}/g" /fluentd/etc/${FLUENTD_CONF}
sed -i -e "s/%URLTOKEN%/${SUMO_URLTOKEN}/g" /fluentd/etc/${FLUENTD_CONF}

exec fluentd -c /fluentd/etc/${FLUENTD_CONF} -p /fluentd/plugins ${FLUENTD_OPT}