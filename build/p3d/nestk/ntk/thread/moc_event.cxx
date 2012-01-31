/****************************************************************************
** Meta object code from reading C++ file 'event.h'
**
** Created: Tue Jan 31 00:16:43 2012
**      by: The Qt Meta Object Compiler version 62 (Qt 4.7.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../../p3d/nestk/ntk/thread/event.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'event.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 62
#error "This file was generated using the moc from 4.7.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_ntk__EventBroadcasterUpdated[] = {

 // content:
       5,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

       0        // eod
};

static const char qt_meta_stringdata_ntk__EventBroadcasterUpdated[] = {
    "ntk::EventBroadcasterUpdated\0"
};

const QMetaObject ntk::EventBroadcasterUpdated::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_ntk__EventBroadcasterUpdated,
      qt_meta_data_ntk__EventBroadcasterUpdated, 0 }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &ntk::EventBroadcasterUpdated::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *ntk::EventBroadcasterUpdated::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *ntk::EventBroadcasterUpdated::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_ntk__EventBroadcasterUpdated))
        return static_cast<void*>(const_cast< EventBroadcasterUpdated*>(this));
    if (!strcmp(_clname, "QEvent"))
        return static_cast< QEvent*>(const_cast< EventBroadcasterUpdated*>(this));
    return QObject::qt_metacast(_clname);
}

int ntk::EventBroadcasterUpdated::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_ntk__AsyncEventListener[] = {

 // content:
       5,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

       0        // eod
};

static const char qt_meta_stringdata_ntk__AsyncEventListener[] = {
    "ntk::AsyncEventListener\0"
};

const QMetaObject ntk::AsyncEventListener::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_ntk__AsyncEventListener,
      qt_meta_data_ntk__AsyncEventListener, 0 }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &ntk::AsyncEventListener::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *ntk::AsyncEventListener::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *ntk::AsyncEventListener::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_ntk__AsyncEventListener))
        return static_cast<void*>(const_cast< AsyncEventListener*>(this));
    if (!strcmp(_clname, "SyncEventListener"))
        return static_cast< SyncEventListener*>(const_cast< AsyncEventListener*>(this));
    return QObject::qt_metacast(_clname);
}

int ntk::AsyncEventListener::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
QT_END_MOC_NAMESPACE
