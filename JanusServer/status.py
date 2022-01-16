import json

'''
Immutable object representing the current gaming status.
'''


class Status:
    def __init__(self, gaming_status):
        if not isinstance(gaming_status, bool):
            raise ValueError("Specified gaming status must be of type bool!")
        self.__gaming_status = gaming_status

    def get_gaming_status(self):
        return bool(self.__gaming_status)

    def to_json(self):
        return json.dumps(self, default=lambda o: o.__dict__,
                          sort_keys=True, indent=4)

    def __str__(self):
        return "Gaming status: " + str(self.__gaming_status)
