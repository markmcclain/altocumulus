from oslo.config import cfg

CUMULUS_DRIVER_OPTS = [
    cfg.StrOpt('scheme',
               default='http',
               help='Scheme for base URL for the Altocumulus API'),
    cfg.IntOpt('protocol_port',
               default='8140',
               help='Protocol port for base URL for the Altocumulus API'),
]

cfg.CONF.register_opts(CUMULUS_DRIVER_OPTS, 'ml2_cumulus')
