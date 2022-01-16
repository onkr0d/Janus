from status import Status


def test_app():
    status = Status(True)
    if not status.get_gaming_status():
        raise AssertionError("Object instantiated with wrong value.")
