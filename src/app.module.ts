import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { AuthModule } from './auth/auth.module';
import { UserModule } from './user/user.module';
import { CartModule } from './cart/cart.module';
import { CatalogModule } from './catalog/catalog.module';
import { CmsModule } from './cms/cms.module';
import { DashboardModule } from './dashboard/dashboard.module';
import { DolyameModule } from './dolyame/dolyame.module';
import { MsModule } from './ms/ms.module';
import { OrdersModule } from './orders/orders.module';
import { TasksModule } from './tasks/tasks.module';
import { PrismaModule } from './prisma/prisma.module';
import { WsModule } from './ws/ws.module';

@Module({
  imports: [
    AuthModule,
    UserModule,
    CartModule,
    CatalogModule,
    CmsModule,
    DashboardModule,
    DolyameModule,
    MsModule,
    OrdersModule,
    TasksModule,
    PrismaModule,
    WsModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
