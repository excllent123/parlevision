/**
  * Copyright (C)2010 by Michel Jansen and Richard Loos
  * All rights reserved.
  *
  * This file is part of the plvgui module of ParleVision.
  *
  * ParleVision is free software: you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
  * the Free Software Foundation, either version 3 of the License, or
  * (at your option) any later version.
  *
  * ParleVision is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  * GNU General Public License for more details.
  *
  * A copy of the GNU General Public License can be found in the root
  * of this software package directory in the file LICENSE.LGPL.
  * If not, see <http://www.gnu.org/licenses/>.
  */

#include "RendererFactory.h"

#include <QDebug>
#include <typeinfo>

#include "OpenCVImageRenderer.h"
#include "DataRenderer.h"

#include <plvcore/OpenCVImage.h>

using namespace plvgui;

DataRenderer* RendererFactory::create(QString dataType, QWidget *parent)
        throw(RendererCreationException)
{
    //TODO make this dynamic
    qDebug() << "RendererFactory creating "<<dataType;
    if(dataType == typeid(plv::OpenCVImage).name())
    {
        return new OpenCVImageRenderer(parent);
    }
    else
    {
        QString msg = "Unsupported type '" + dataType + "'";
        throw RendererCreationException( msg.toStdString() );
    }
}
