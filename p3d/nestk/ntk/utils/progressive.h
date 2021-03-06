/**
 * This file is part of the nestk library.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * Author: Nicolas Burrus <nicolas.burrus@uc3m.es>, (C) 2010
 */

#ifndef NTK_UTILS_PROGRESSIVE_H
#define NTK_UTILS_PROGRESSIVE_H

#include <ntk/core.h>

#include <QObject>

namespace ntk
{

class Progressive : public QObject
{
    Q_OBJECT

public:
    virtual void progress(const char* message, float percent) const;

signals:
    void progressChanged(QString, float) const;
};

}  // ntk

#endif // NTK_UTILS_PROGRESSIVE_H
