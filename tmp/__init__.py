def getTrackData (bname = None):
    import models.tmp.tmp
    res = []
    for k in [
    		  models.tmp.tmp,
              ]:
        res = res+k.getTrackData (bname or "tmp")
    return res
